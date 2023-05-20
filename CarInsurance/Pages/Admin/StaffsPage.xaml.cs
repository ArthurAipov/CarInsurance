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
    /// Interaction logic for StaffsPage.xaml
    /// </summary>
    public partial class StaffsPage : Page
    {
        public StaffsPage(DataBase.User mainUser)
        {
            InitializeComponent();
            Refresh();

        }

        public void Refresh()
        {
            var staff = GlobalSettings.DB.User.Where(u => u.RoleId == 2 || u.RoleId == 4 || u.RoleId == 1).ToList();
            DataGridStaff.ItemsSource = staff;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Refresh();
        }

        private void ButtonAddStuff_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddStaffPage());
        }

        private void ButtonDeleteStaff_Click(object sender, RoutedEventArgs e)
        {
            var selectedUser = DataGridStaff.SelectedItem as User;
            if (selectedUser == null)
            {
                MessageBox.Show("Выберите пользователя");
                return;
            }
            if (selectedUser.Staff.Count != 0)
            {
                foreach (var staff in GlobalSettings.DB.Staff)
                {
                    if (staff.UserId == selectedUser.Id)
                    {
                        GlobalSettings.DB.Staff.Remove(staff);
                    }
                }
                    GlobalSettings.DB.SaveChanges();
            }
            GlobalSettings.DB.User.Remove(selectedUser);
            GlobalSettings.DB.SaveChanges();
            Refresh();
        }
    }
}
