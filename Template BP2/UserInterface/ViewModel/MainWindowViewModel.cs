using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UserInterface.ViewModel
{
    public class MainWindowViewModel : BindableBase
    {
        public MyICommand<string> NavCommand { get; private set; }
        private StudentViewModel studentViewModel = new StudentViewModel();
        private StudentskiDomViewModel studentskiDomViewModel = new StudentskiDomViewModel();
        private SobaViewModel sobaViewModel = new SobaViewModel();
        private StanujeViewModel stanujeViewModel = new StanujeViewModel();
        private PrijavljujeViewModel prijavljujeViewModel = new PrijavljujeViewModel();
        private DomarViewModel domarViewModel = new DomarViewModel();
        private KvarViewModel kvarViewModel = new KvarViewModel();
        private BindableBase currentViewModel;

        public MainWindowViewModel()
        {
            NavCommand = new MyICommand<string>(OnNav);
            CurrentViewModel = studentskiDomViewModel;
        }

        public BindableBase CurrentViewModel
        {
            get { return currentViewModel; }
            set
            {
                SetProperty(ref currentViewModel, value);
            }
        }

        private void OnNav(string destination)
        {
            switch (destination)
            {
                case "dom":
                    CurrentViewModel = studentskiDomViewModel;
                    break;
                case "student":
                    CurrentViewModel = studentViewModel;
                    break;
                case "soba":
                    CurrentViewModel = sobaViewModel;
                    break;
                case "stanuje":
                    CurrentViewModel = stanujeViewModel;
                    break;
                case "prijavljuje":
                    CurrentViewModel = prijavljujeViewModel;
                    break;
                case "domar":
                    CurrentViewModel = domarViewModel;
                    break;
                case "kvar":
                    CurrentViewModel = kvarViewModel;
                    break;
            }
        }
    }
}
