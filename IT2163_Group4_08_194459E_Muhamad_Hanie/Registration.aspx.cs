using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions; // for Regular expression
using System.Drawing; // for change of color
using System.Security.Cryptography;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace IT2163_Group4_08_194459E_Muhamad_Hanie
{
    public partial class Registration : System.Web.UI.Page
    {
        string MYDBConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Assignment"].ConnectionString;
        static string finalHash;
        static string salt;
        byte[] Key;
        byte[] IV;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void btnCheckPassword_Click(object sender, EventArgs e)
        {
            int scores = checkPassword(tb_password.Text);
            string status = "";
            switch (scores)
            {
                case 1:
                    status = "Very Weak";
                    break;
                case 2:
                    status = "Weak";
                    break;
                case 3:
                    status = "Medium";
                    break;
                case 4:
                    status = "Strong";
                    break;
                case 5:
                    status = "Excellent";
                    break;
                default:
                    break;
            }
            lbl_pwdchecker.Text = "Status : " + status;
            if (scores < 4)
            {
                lbl_pwdchecker.ForeColor = Color.Red;
                return;
            }
            lbl_pwdchecker.ForeColor = Color.Green;
        }
        private int checkPassword(string password)
        {
            int score = 0;

            // Score 0 very weak
            // if length of password is less than 8 chars
            if (password.Length < 8)
            {
                return 1;
            }
            else
            {
                score = 1;
            }
            // Score 2 Weak
            if (Regex.IsMatch(password, "[a-z]"))
            {
                score++;
            }
            else
            {
                return 2;
            }
            // Score 3 Medium
            if (Regex.IsMatch(password, "[A-Z]"))
            {
                score++;
            }
            else
            {
                return 3;
            }
            // Score 4 Strong
            if (Regex.IsMatch(password, "[0-9]"))
            {
                score++;
            }
            else
            {
                return 4;
            }
            // Score 5 Excellent
            if (Regex.IsMatch(password, "[^A-Za-z0-9]"))
            {
                score++;
            }
            else
            {
                score = 5;
            }
            lbl_error.Text = "Password Complexity - Excellent!";
            return score;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
            
            //string pwd = get value from your Textbox
            string pwd = tb_password.Text.ToString().Trim();
            

            //Generate random "salt"
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            byte[] saltByte = new byte[8];

            //Fills array of bytes with a cryptographically strong sequence of random values.
            rng.GetBytes(saltByte);
            salt = Convert.ToBase64String(saltByte);
            SHA512Managed hashing = new SHA512Managed();
            string pwdWithSalt = pwd + salt;
            byte[] plainHash = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwd));
            byte[] hashWithSalt = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwdWithSalt));

            finalHash = Convert.ToBase64String(hashWithSalt);


            RijndaelManaged cipher = new RijndaelManaged();
            cipher.GenerateKey();
            Key = cipher.Key;
            IV = cipher.IV;

            createAccount();
            Response.Redirect("HomePage.aspx", false);

            //XSS Attempt
            lb_error1.Text = HttpUtility.HtmlEncode(tb_email.Text);
            lb_error1.Text = HttpUtility.HtmlEncode(tb_confirmation_password.Text);
            lb_error1.Text = HttpUtility.HtmlEncode(tb_creditcard.Text);
            lb_error1.Text = HttpUtility.HtmlEncode(tb_FirstName.Text);
            lb_error1.Text = HttpUtility.HtmlEncode(tb_LastName.Text);
            lb_error1.Text = HttpUtility.HtmlEncode(tb_DateofBirth.Text);

        }

        public void createAccount()
        {
            
            using (SqlConnection con = new SqlConnection(MYDBConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Account VALUES(@Email, @PasswordHash, @PasswordSalt, @CreditCard, @FirstName, @LastName, @DateofBirth, @DateTimeRegistered, @IV, @Key)"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@Email", tb_email.Text.Trim());
                        cmd.Parameters.AddWithValue("@PasswordHash", finalHash);
                        cmd.Parameters.AddWithValue("@PasswordSalt", salt);
                        cmd.Parameters.AddWithValue("@CreditCard", encryptData(tb_creditcard.Text.Trim()));
                        cmd.Parameters.AddWithValue("@FirstName", tb_FirstName.Text.Trim());
                        cmd.Parameters.AddWithValue("@LastName", tb_LastName.Text.Trim());
                        cmd.Parameters.AddWithValue("@DateofBirth", tb_DateofBirth.Text.Trim());
                        cmd.Parameters.AddWithValue("@DateTimeRegistered", DateTime.Now);
                        cmd.Parameters.AddWithValue("@IV", Convert.ToBase64String(IV));
                        cmd.Parameters.AddWithValue("@Key", Convert.ToBase64String(Key));
                        cmd.Connection = con;
                        try
                        {
                            con.Open();
                            cmd.ExecuteNonQuery();
                            //con.Close();
                        }
                        catch (Exception ex)
                        {
                            //throw new Exception(ex.ToString());
                            lb_error1.Text = ex.ToString();
                        }
                        finally
                        {
                            con.Close();
                        }

                    }
                }
            }

        }

        protected byte[] encryptData(string data)
        {
            byte[] cipherText = null;
            try
            {
                RijndaelManaged cipher = new RijndaelManaged();
                cipher.IV = IV;
                cipher.Key = Key;
                ICryptoTransform encryptTransform = cipher.CreateEncryptor();
                //ICryptoTransform decryptTransform = cipher.CreateDecryptor();
                byte[] plainText = Encoding.UTF8.GetBytes(data);
                cipherText = encryptTransform.TransformFinalBlock(plainText, 0, plainText.Length);
            }
            catch (Exception ex)
            {
                //throw new Exception(ex.ToString());
                lb_error1.Text = ex.ToString();
            }
            finally { }
            return cipherText;
        }
    }
}