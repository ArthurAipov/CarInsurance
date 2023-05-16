using CarInsurance.Models;
using CarInsurance.Pages.Accountant;
using CarInsurance.Pages.Admin;
using CarInsurance.Pages.Appraiser;
using CarInsurance.Pages.Client;
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
    /// Interaction logic for AutorizationPage.xaml
    /// </summary>
    public partial class AutorizationPage : Page
    {
        public string Password = "";
        public string FinallyPassword = "";
        public string TextWithSecurity;
        public AutorizationPage()
        {
            InitializeComponent();
            if (Properties.Settings.Default.RememberMe)
            {
                FinallyPassword = Properties.Settings.Default.Password;
                Password = Properties.Settings.Default.Password;
                TextBoxLogin.Text = Properties.Settings.Default.Login;
                CheckBoxRemember.IsChecked = Properties.Settings.Default.RememberMe;
                Refresh();
                TextBoxPassword.Text = TextWithSecurity;
            }
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
            if (CheckBoxRemember.IsChecked.Value)
            {
                Properties.Settings.Default.Login = TextBoxLogin.Text;
                Properties.Settings.Default.Password = FinallyPassword;
                Properties.Settings.Default.RememberMe = CheckBoxRemember.IsChecked.Value;
                Properties.Settings.Default.Save();
            }
            else
            {
                Properties.Settings.Default.Login = "";
                Properties.Settings.Default.Password = "";
                Properties.Settings.Default.RememberMe = CheckBoxRemember.IsChecked.Value;
                Properties.Settings.Default.Save();

            }
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
            var user = GlobalSettings.DB.User.FirstOrDefault(u => u.Password == FinallyPassword && u.Login == TextBoxLogin.Text);
            if (user == null)
            {
                MessageBox.Show("Неправильный логин или пароль");
                return;
            }
            if (user.RoleId == 1)
            {
                NavigationService.Navigate(new MainPageAdmin(user));
                return;
            }
            if (user.RoleId == 2)
            {
                NavigationService.Navigate(new MainPageAccountant(user));
                return;
            }
            if (user.RoleId == 3)
            {
                NavigationService.Navigate(new MainPageClient(user));
                return;
            }
            if (user.RoleId == 4)
            {
                NavigationService.Navigate(new MainPageAppraiser(user));
                return;
            }
        }

        private void ButtonRegistration_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new RegistrationPage());
        }
    }
}
