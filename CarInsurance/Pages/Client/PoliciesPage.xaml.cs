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

namespace CarInsurance.Pages.Client
{
    /// <summary>
    /// Interaction logic for Policies.xaml
    /// </summary>
    public partial class Policies : Page
    {
        public Policies(DataBase.User mainUser)
        {
            InitializeComponent();
            var driver = GlobalSettings.DB.Driver.FirstOrDefault(u => u.UserId == mainUser.Id);
            DataGridOsago.ItemsSource = GlobalSettings.DB.Osago.Where(u => u.DriverId == driver.Id).ToList();
            DataGridCasco.ItemsSource = GlobalSettings.DB.Casco.Where(u => u.DriverId == driver.Id).ToList();

        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
