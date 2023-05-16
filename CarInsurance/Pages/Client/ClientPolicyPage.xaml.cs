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

namespace CarInsurance.Pages.Client
{
    /// <summary>
    /// Interaction logic for ClientPolicyPage.xaml
    /// </summary>
    public partial class ClientPolicyPage : Page
    {
        public User MainUser;
        public ClientPolicyPage(DataBase.User mainUser)
        {
            InitializeComponent();
            MainUser = mainUser;
        }

        private void ButtonCasco_Click(object sender, RoutedEventArgs e)
        {
            if(MainUser.Driver.Count == 0)
            {
                MessageBox.Show("Сначала заполните данные водителя");
                return;
            }
            NavigationService.Navigate(new ClientCascoPage(MainUser));
        }

        private void ButtonOsago_Click(object sender, RoutedEventArgs e)
        {
            if (MainUser.Driver.Count == 0)
            {
                MessageBox.Show("Сначала заполните данные водителя");
                return;
            }
            NavigationService.Navigate(new ClientOsagoPage(MainUser));
        }

        private void ButtonPolicies_Click(object sender, RoutedEventArgs e)
        {
            if (MainUser.Driver.Count == 0)
            {
                MessageBox.Show("Сначала заполните данные водителя");
                return;
            }
            NavigationService.Navigate(new Policies(MainUser));
        }
    }
}
