using CarInsurance.DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarInsurance.Models
{
    public static class GlobalSettings
    {
        public static CarInsuranceEntities DB = new CarInsuranceEntities();
    }
}
