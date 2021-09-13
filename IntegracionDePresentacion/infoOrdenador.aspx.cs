using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IntegracionDePresentacion
{
    public partial class infoOrdenador : System.Web.UI.Page
    {
        public string content { get; set; }
        public static List<string> dato { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            dato = new List<string>();
            Process cmd = new Process();
            cmd.StartInfo.FileName = "cmd.exe";
            cmd.StartInfo.RedirectStandardOutput = true;
            cmd.StartInfo.RedirectStandardInput = true;
            cmd.StartInfo.UseShellExecute = false;
            cmd.Start();

            cmd.StandardInput.WriteLine("systeminfo");
            cmd.StandardInput.Close();
            cmd.WaitForExit();
            content = cmd.StandardOutput.ReadToEnd();

            addData("Product ID:", "Original Install Date", 12);
            addData("System Model:", "System Type", 14);
            addData("System Type:", "Processor(s)", 13);
            addData("Registered Owner:", "Registered Organization", 18);
            addData("Host Name:", "OS Name", 11);
            addData("Time Zone:", "Total Physical Memory", 11);
            addData("BIOS Version:", "Windows Directory", 14);
            addData("Total Physical Memory:", "Available Physical Memory", 23);
        }

        public void addData(string start, string end, int startlen)
        {
            var s = content.IndexOf(start);
            s += startlen;
            var e = content.IndexOf(end, s);
            var length = e - s;
            dato.Add(content.Substring(s, length).Trim());
        }

        [WebMethod(EnableSession = true)]
        public static string saveFile(string dir)
        {
            var info = "";
            try
            {
                info = "Id. del producto: \t\t" + dato[0] + "\n" + "Modelo del sistema: \t\t" + dato[1] + "\n" + "Tipo de sistema: \t\t" + dato[2] + "\n" + "Propiedad de: \t\t\t" + dato[3] + "\n" + "Nombre de host: \t\t" + dato[4] + 
                    "\n" + "Zona horaria: \t\t\t" + dato[5] + "\n" + "Versión de BIOS: \t\t" + dato[6] + "\n" + "Memoria física (RAM): \t\t" + dato[7];

                File.WriteAllText(dir + @"\InfoOrdenador.txt", info);
            } catch(Exception e)
            {
                return "Error";
            }

            return "OK";
        }
    }
}