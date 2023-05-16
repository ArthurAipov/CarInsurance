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

namespace CarInsurance.Pages.Accountant
{
    /// <summary>
    /// Interaction logic for InsuranceDataPage.xaml
    /// </summary>
    public partial class InsuranceDataPage : Page
    {
        public List<InsuranceType> insuranceTypes = new List<InsuranceType>();
        public List<SortModel> sorttypes = new List<SortModel>();
        public List<OsagoCasco> ListOsagoCasco = new List<OsagoCasco>();
        public InsuranceDataPage()
        {
            InitializeComponent();
            var firstType = new InsuranceType { Id = 1, Name = "Все" };
            insuranceTypes.Add(firstType);
            var secondType = new InsuranceType { Id = 2, Name = "ОСАГО" };
            insuranceTypes.Add(secondType);
            var thirdType = new InsuranceType { Id = 1, Name = "КАСКО" };
            insuranceTypes.Add(thirdType);
            ComboBoxType.ItemsSource = insuranceTypes.ToList();
            var fourthSortModel = new SortModel { Id = 1, Name = "Все" };
            var firstSortModel = new SortModel { Id = 2, Name = "По дате начала" };
            var secondSortModel = new SortModel { Id = 3, Name = "По цене" };
            var thirdSortModel = new SortModel { Id = 4, Name = "Номеру машин" };
            sorttypes.Add(fourthSortModel);
            sorttypes.Add(firstSortModel);
            sorttypes.Add(secondSortModel);
            sorttypes.Add(thirdSortModel);
            ComboBoxSort.ItemsSource = sorttypes.ToList();
            ComboBoxType.SelectedIndex = 0;
            foreach (var casco in GlobalSettings.DB.Casco)
            {
                var cascoForList = new OsagoCasco { CarNumber = casco.Car.Number, DateEnd = casco.DateEnd, DateStart = casco.DateStart, ThisType = "КАСКО", Price = casco.Price };
                ListOsagoCasco.Add(cascoForList);
            }
            foreach (var osago in GlobalSettings.DB.Osago)
            {
                var osagoForList = new OsagoCasco { CarNumber = osago.Car.Number, DateEnd = osago.DateEnd, DateStart = osago.DateStart, ThisType = "ОСАГО", Price = osago.Price };
                ListOsagoCasco.Add(osagoForList);
            }
            Refresh();
        }
        public void Refresh()
        {
            var selectedType = ComboBoxType.SelectedItem as InsuranceType;
            var selectedSortType = ComboBoxSort.SelectedItem as SortModel;
            var searchNumber = TextBoxSearch.Text;
            var filter = ListOsagoCasco;
            if (selectedType.Id == 1)
            {
                filter = ListOsagoCasco;
            }
            if (selectedType.Id == 2)
            {
                filter = filter.Where(u => u.ThisType == "ОСАГО").ToList();
            }
            if (selectedType.Id == 3)
            {
                filter = filter.Where(u => u.ThisType == "КАСКО").ToList();
            }
            if (!string.IsNullOrWhiteSpace(searchNumber))
            {
                filter = filter.Where(u => u.CarNumber.Contains(TextBoxSearch.Text)).ToList();
            }
            if (selectedSortType != null)
            {
                if (selectedSortType.Id == 2)
                {
                    filter = filter.OrderByDescending(u => u.DateStart).ToList();
                }
                if (selectedSortType.Id == 3)
                {
                    filter = filter.OrderByDescending(u => u.Price).ToList();

                }
                if (selectedSortType.Id == 4)
                {
                    filter = filter.OrderByDescending(u => u.CarNumber).ToList();

                }
            }
            DataGridInsurance.ItemsSource = filter.ToList();
        }

        private void ComboBoxSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Refresh();
        }

        private void TextBoxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            Refresh();

        }

        private void ComboBoxType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Refresh();

        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Refresh();

        }
    }
}
