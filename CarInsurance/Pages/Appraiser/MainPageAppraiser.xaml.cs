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

namespace CarInsurance.Pages.Appraiser
{
    /// <summary>
    /// Interaction logic for MainPageAppraiser.xaml
    /// </summary>
    public partial class MainPageAppraiser : Page
    {
        public User MainUser;
        public MainPageAppraiser(DataBase.User user)
        {
            InitializeComponent();
            MainUser = user;
        }

        private void ButtondsProfile_Click(object sender, RoutedEventArgs e)
        {
            AdminFrame.NavigationService.Navigate(new ProfileStaffPage(MainUser));
        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
