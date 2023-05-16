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

namespace CarInsurance.Pages.Admin
{
    /// <summary>
    /// Interaction logic for AddStaffPage.xaml
    /// </summary>
    public partial class AddStaffPage : Page
    {
        public AddStaffPage()
        {
            InitializeComponent();
            ComboBoxRole.ItemsSource = GlobalSettings.DB.Role.Where(u => u.Id != 3).ToList();
        }

        private void ButtonLogin_Click(object sender, RoutedEventArgs e)
        {
            var errorMessage = "";
            var selectedRole = ComboBoxRole.SelectedItem as Role;
            if (selectedRole == null)
                errorMessage += "Выберите роль для пользователя";
            if (TextBoxLogin.Text.ToLower() == "login" || string.IsNullOrWhiteSpace(TextBoxLogin.Text))
                errorMessage += "Введите Логин \n";
            if (TextBoxPassword.Text.ToLower() == "password" || string.IsNullOrWhiteSpace(TextBoxPassword.Text))
                errorMessage += "Введите Пароль \n";
            if (!string.IsNullOrWhiteSpace(errorMessage))
            {
                MessageBox.Show(errorMessage);
                return;
            }
            var user = GlobalSettings.DB.User.FirstOrDefault(u => u.Login == TextBoxLogin.Text);
            if (user != null)
            {
                MessageBox.Show("Данный логин уже занят");
                return;
            }
            var newUser = new User { Login = TextBoxLogin.Text, Password = TextBoxPassword.Text, RoleId = selectedRole.Id };
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
