using CarInsurance.DataBase;
using CarInsurance.Models;
using CarInsurance.Windows;
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

namespace CarInsurance.Pages.Client
{
    /// <summary>
    /// Interaction logic for Policies.xaml
    /// </summary>
    public partial class Policies : Page
    {
        public User MainUser;
        public Policies(DataBase.User mainUser)
        {
            InitializeComponent();
            var driver = GlobalSettings.DB.Driver.FirstOrDefault(u => u.UserId == mainUser.Id);
            DataGridOsago.ItemsSource = GlobalSettings.DB.Osago.Where(u => u.DriverId == driver.Id).ToList();
            DataGridCasco.ItemsSource = GlobalSettings.DB.Casco.Where(u => u.DriverId == driver.Id).ToList();
            MainUser = mainUser;

        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

     
        private void DataGridOsago_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var selectedOsago = DataGridOsago.SelectedItem as Osago;
            if(selectedOsago != null)
            {
                new IncuranceClaimOsagoPage(selectedOsago).ShowDialog();
            }
        }

        private void DataGridCasco_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var selectedCasco = DataGridCasco.SelectedItem as Casco;
            if(selectedCasco != null)
            {
                new InsuraceClaimCascoWindow(selectedCasco).ShowDialog();
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new InsuranceClaimListPage(MainUser));
        }
    }
}
