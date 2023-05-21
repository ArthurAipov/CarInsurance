using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarInsurance.DataBase
{
    public partial class Driver
    {
        public string StatusBlackList
        {
            get
            {
                var status = "";
                if (BlackList)
                    status = "В черном списке";
                else
                    status = "Не в черном списке";
                return status;
            }
        }

        public int EmergencyCount
        {
            get
            {
                var emergencyCount = EmergencyApplication.Where(u => u.DriverId == Id).ToList().Count();
                return emergencyCount;
            }
        }

        public double FullPriceForAllEmergency
        {
            get
            {
                double fullPriceForAllEmergency = 0;
                foreach(var emergency in EmergencyApplication)
                {
                    if(emergency.DriverId == Id)
                    {
                        fullPriceForAllEmergency += emergency.Price;
                    }
                }
                return fullPriceForAllEmergency;
            }
        }
    }
}
