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

namespace CarInsurance.Pages.Client
{
    /// <summary>
    /// Interaction logic for ClientTransportPage.xaml
    /// </summary>
    public partial class ClientTransportPage : Page
    {
        public User MainUser;
        public ClientTransportPage(DataBase.User mainUser)
        {
            InitializeComponent();
            MainUser = mainUser;
            DataContext = MainUser;

        }
        public void Refresh()
        {
            var user = DataContext as User;
           
                var cars = GlobalSettings.DB.Car.Where(u => u.Driver.UserId == user.Id).ToList();
                DataGridCar.ItemsSource = cars;
            
        }

        private void ButtonAdd_Click(object sender, RoutedEventArgs e)
        {
            var user = DataContext as User;
            var driver = GlobalSettings.DB.Driver.Where(u => u.UserId == user.Id).ToList();
            if (driver.Count == 0)
            {
                MessageBox.Show("Сначала заполните данные водителя");
                return;
            }
            NavigationService.Navigate(new AddCarPage(user));
        }

        private void ButtonDelete_Click(object sender, RoutedEventArgs e)
        {
            var selectedCar = DataGridCar.SelectedItem as Car;
            if (selectedCar == null)
            {
                MessageBox.Show("Выберите Машину для удаления из профиля");
                return;
            }
            if(selectedCar.Osago.Count != 0)
            {
                foreach(var carOsago in GlobalSettings.DB.Osago)
                {
                    if(carOsago.CarId == selectedCar.Id)
                    {
                        GlobalSettings.DB.Osago.Remove(carOsago);
                    }
                }
                GlobalSettings.DB.SaveChanges();
            }
            if (selectedCar.Casco.Count != 0)
            {
                foreach (var carCasco in GlobalSettings.DB.Casco)
                {
                    if (carCasco.CarId == selectedCar.Id)
                    {
                        GlobalSettings.DB.Casco.Remove(carCasco);
                    }
                }
                GlobalSettings.DB.SaveChanges();
            }
            GlobalSettings.DB.Car.Remove(selectedCar);
            GlobalSettings.DB.SaveChanges();
            Refresh();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Refresh();
        }
    }
}
