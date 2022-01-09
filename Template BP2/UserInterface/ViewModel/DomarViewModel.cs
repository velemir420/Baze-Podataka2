using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using UserInterface.Model;

namespace UserInterface.ViewModel
{
    public class DomarViewModel : BindableBase
    {
        public MyICommand Create { get; private set; }
        public MyICommand Delete { get; private set; }
        public MyICommand Update { get; private set; }
        private string id;
        private string licenca;
        private List<domar> domari = new List<domar>();
        private domar selectedDomar;
        private List<radnik> radnici = new List<radnik>();
        private radnik selectedRadnik;

        public DomarViewModel()
        {
            Create = new MyICommand(OnCreate, CanCreate);
            Delete = new MyICommand(OnDelete, CanDelete);
            Update = new MyICommand(OnUpdate, CanUpdate);

            using (var db = new StudentskiCentarEntities())
            {
                Domari = db.domars.ToList();
                Radnici = db.radniks.ToList();
            }
        }

        public domar SelectedDomar
        {
            get
            {
                return selectedDomar;
            }
            set
            {
                selectedDomar = value;
                if (SelectedDomar != null)
                {
                    Licenca = value.licenca.ToString();
                }
                OnPropertyChanged("SelectedDomar");
                Delete.RaiseCanExecuteChanged();
                Update.RaiseCanExecuteChanged();
            }
        }

        public radnik SelectedRadnik
        {
            get
            {
                return selectedRadnik;
            }
            set
            {
                selectedRadnik = value;
                OnPropertyChanged("SelectedRadnik");
                Delete.RaiseCanExecuteChanged();
                Update.RaiseCanExecuteChanged();
                Create.RaiseCanExecuteChanged();
            }
        }

        public string Licenca
        {
            get
            {
                return licenca;
            }
            set
            {
                licenca = value;
                OnPropertyChanged("Licenca");
                Delete.RaiseCanExecuteChanged();
                Update.RaiseCanExecuteChanged();
                Create.RaiseCanExecuteChanged();
            }
        }

        public List<domar> Domari
        {
            get
            {
                return domari;
            }
            set
            {
                domari = value;
                OnPropertyChanged("Domari");
            }
        }

        public List<radnik> Radnici
        {
            get
            {
                return radnici;
            }
            set
            {
                radnici = value;
                OnPropertyChanged("Radnici");
            }
        }


        private bool CanUpdate()
        {
            if(SelectedDomar != null && SelectedRadnik != null && !String.IsNullOrEmpty(Licenca))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private bool CanDelete()
        {
            if (SelectedDomar != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private bool CanCreate()
        {
            if (SelectedRadnik != null && !String.IsNullOrEmpty(Licenca))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private void OnUpdate()
        {
            using (var db = new StudentskiCentarEntities())
            {
                domar dm = db.domars.Where(x => x.id_radnik == SelectedDomar.id_radnik).FirstOrDefault();

                if (dm != null)
                {
                    dm.licenca = Licenca;
                    db.SaveChanges();
                    MessageBox.Show("Uspesno obrisan domar iz baze");
                    Domari = db.domars.ToList();
                }
                else
                {
                    MessageBox.Show("Domar sa unetim ID-om ne postoji u bazi");
                }
            }
        }

        private void OnDelete()
        {
            using (var db = new StudentskiCentarEntities())
            {
                domar dm = db.domars.Where(x => x.id_radnik == SelectedDomar.id_radnik).FirstOrDefault();

                if (dm != null)
                {
                    db.domars.Remove(dm);
                    db.SaveChanges();
                    MessageBox.Show("Uspesno obrisan domar iz baze");
                    Domari = db.domars.ToList();
                }
                else
                {
                    MessageBox.Show("Domar sa unetim ID-om ne postoji u bazi");
                }
            }
        }

        private void OnCreate()
        {
            using (var db = new StudentskiCentarEntities())
            {
                int id = SelectedRadnik.id_radnik;
                domar dm = db.domars.Where(x => x.id_radnik == id).FirstOrDefault();

                if (dm == null)
                {
                    db.domars.Add(new domar() { id_radnik = id, licenca = Licenca});
                    db.SaveChanges();
                    MessageBox.Show("Uspesno unet domar u bazu");
                    Domari = db.domars.ToList();
                }
                else
                {
                    MessageBox.Show("Domar sa unetim ID-om vec postoji u bazi");
                }
            }
        }
    }
}
