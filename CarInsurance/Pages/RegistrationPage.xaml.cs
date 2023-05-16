using CarInsurance.DataBase;
using CarInsurance.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace CarInsurance.Pages
{
    /// <summary>
    /// Interaction logic for RegistrationPage.xaml
    /// </summary>
    ///  public string Password = "";
    public partial class RegistrationPage : Page
    {
        public string Password = "";
        public string FinallyPassword = "";
        public string TextWithSecurity;
        public RegistrationPage()
        {
            InitializeComponent();
        }

        public void Refresh()
        {
            var textWithSecurity = "";
            if (Password != "Password" || string.IsNullOrWhiteSpace(Password))
            {
                for (int i = 0; i < Password.Length; i++)
                {
                    textWithSecurity += "*";
                }
            }
            TextWithSecurity = textWithSecurity;
        }

        private void TextBoxLogin_GotFocus(object sender, RoutedEventArgs e)
        {
            if (TextBoxLogin.Text == "Login")
            {
                TextBoxLogin.Text = "";
            }
        }

        private void TextBoxLogin_LostFocus(object sender, RoutedEventArgs e)
        {
            var text = TextBoxLogin.Text;
            if (string.IsNullOrWhiteSpace(text) || text == "Login")
            {
                TextBoxLogin.Text = "Login";
            }
        }

        private void TextBoxPassword_GotFocus(object sender, RoutedEventArgs e)
        {
            TextBoxPassword.Text = FinallyPassword;
            if (TextBoxPassword.Text == "Password" || string.IsNullOrWhiteSpace(TextBoxPassword.Text))
            {
                TextBoxPassword.Text = "";
            }
        }

        private void TextBoxPassword_LostFocus(object sender, RoutedEventArgs e)
        {
            var text = TextBoxPassword.Text;
            if (string.IsNullOrWhiteSpace(text) || text == "Password")
            {
                TextBoxPassword.Text = "Password";
            }
            else
            {
                FinallyPassword = TextBoxPassword.Text;
                TextBoxPassword.Text = TextWithSecurity;
            }
        }

        private void TextBoxPassword_TextChanged(object sender, TextChangedEventArgs e)
        {
            Password = TextBoxPassword.Text;
            Refresh();

        }

        private void ButtonLogin_Click(object sender, RoutedEventArgs e)
        {
            var errorMessage = "";
            if (TextBoxLogin.Text.ToLower() == "login" || string.IsNullOrWhiteSpace(TextBoxLogin.Text))
                errorMessage += "Введите Логин \n";
            if (FinallyPassword.ToLower() == "password" || string.IsNullOrWhiteSpace(FinallyPassword))
                errorMessage += "Введите Пароль \n";
            if (!string.IsNullOrWhiteSpace(errorMessage))
            {
                MessageBox.Show(errorMessage);
                return;
            }
            var user = GlobalSettings.DB.User.FirstOrDefault(u => u.Login == TextBoxLogin.Text);
            if(user != null)
            {
                MessageBox.Show("Данный логин уже занят");
                return;
            }
            var newUser = new User { Login = TextBoxLogin.Text, Password = FinallyPassword, RoleId = 3 };
            GlobalSettings.DB.User.Add(newUser);
            GlobalSettings.DB.SaveChanges();
            NavigationService.GoBack();
        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
