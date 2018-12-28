using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Configuration;

namespace LTP_DAL
{
    public class ErrorHandling
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="MethodName"></param>
        /// <param name="ex"></param>
        public static void WriteErrorDetails(string MethodName, Exception ex)
        {
            string strPath = ConfigurationManager.AppSettings["ErrorFilePath"].ToString();
            if (!File.Exists(strPath))
            {
                File.Create(strPath).Dispose();
            }
            using (StreamWriter sw = File.AppendText(strPath))
            {
                sw.WriteLine("------LTP_Website Error Details---------");
                sw.WriteLine("---------------- Start :  " + DateTime.Now);
                sw.WriteLine("Method Name : " + MethodName);
                sw.WriteLine("Error Message: " + ex.Message);
                sw.WriteLine("Stack Trace: " + ex.StackTrace);
                sw.WriteLine("---------------- End :  " + DateTime.Now);
            }
        }
    }
}
