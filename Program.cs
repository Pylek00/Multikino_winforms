


using Multikino_Winforms.Forms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Multikino_Winforms


{
    static class Program
    {
        /// <summary>
        
        
        /// </summary>
        [STAThread]
        static void Main()
        {

            

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new CELogowanie());
            

        }
    }
}
