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
    /// Interaction logic for MainPageClient.xaml
    /// </summary>
    public partial class MainPageClient : Page
    {
        public User MainUser;
        public MainPageClient(DataBase.User user)
        {
            InitializeComponent();
            MainUser = user;
            DataContext = user;
        }

        private void ButtonProfile_Click(object sender, RoutedEventArgs e)
        {
            ClientFrame.NavigationService.Navigate(new ClientProfilePage(MainUser));

        }

        private void ButtonTransport_Click(object sender, RoutedEventArgs e)
        {
            ClientFrame.NavigationService.Navigate(new ClientTransportPage(MainUser));

        }

        private void ButtonPolicy_Click(object sender, RoutedEventArgs e)
        {
            ClientFrame.NavigationService.Navigate(new ClientPolicyPage(MainUser));
        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
