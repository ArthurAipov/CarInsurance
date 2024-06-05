using CarInsurance.DataBase;
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
    /// Interaction logic for MainPageAdmin.xaml
    /// </summary>
    public partial class MainPageAdmin : Page
    {
        public User MainUser;
        public MainPageAdmin(DataBase.User user)
        {
            InitializeComponent();
            MainUser = user;
        }

        private void ButtonAddStaff_Click(object sender, RoutedEventArgs e)
        {
            AdminFrame.NavigationService.Navigate(new StaffsPage(MainUser));
        }

        private void ButtondsProfile_Click(object sender, RoutedEventArgs e)
        {
            AdminFrame.NavigationService.Navigate(new AdminProfilePage(MainUser));
        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AutorizationPage());
        }
    }
}
