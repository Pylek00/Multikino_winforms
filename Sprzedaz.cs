﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Multikino_Winforms
{
    public static class Sprzedaz
    {
        static public string constring = "Data Source=DESKTOP-L0FMAJB\\TEW_SQLEXPRESS;Initial Catalog=Multikino;Integrated Security=True";
        static private string[] tabela_seansow; //Informacje o seansach w danym dniu w postaci ciągu string
        static private int[] tabela_ID_seansow; // Tablica ID_senasow opisywanych w tabeli wyzej
        static int ID_seansu; //ID aktualnego seansu
        static DataTable status_miejsc_na_seans;
        static int cena_podstawowa_miejsca;
        static int ID_klienta;
        static bool Klient_jest_aktywny;
        static DataTable dane_aktywnego_klienta;
 
        internal static string[] przeszukaj_seanse(string data)
        {
            string d = data;
            SqlConnection con = new SqlConnection(constring);
            con.Open();
            string q = "select * from  Seanse  " +
                "inner join WersjeFilmów on  WersjeFilmów.ID = Seanse.ID_WersjiFilmu " +
                "inner join Filmy on Filmy.ID = WersjeFilmów.ID_Filmu " +
                "where Seanse.ID_Kina =  " + CCentrum_Wszechswiata.wypisz_id_kina() +
                "AND CONVERT(VARCHAR(25), Seanse.DataS, 126) LIKE '" + d + "%' ";
            SqlCommand cmd = new SqlCommand(q, con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable set = new DataTable();
            //adapter.ToString();
            //return adapter.ToString();
            adapter.Fill(set);

            string[] t = Sprzedaz.laczenie_tablicy(set);
            Sprzedaz.tabela_seansow = t;
            tabela_ID_seansow = Sprzedaz.tworzenie_tablicy_ID_seansow(set);

            return t;
        }

        internal static string[] laczenie_tablicy(DataTable table)
        {
            string[] t;
            string s;

            if (table.Rows.Count <= 1)
            {
                t = new string[1];
                t[0] = "Brak seansów w wybranum dniu";
                return t;
            }
            else
            {
                t = new string[table.Rows.Count];
                for (int i = 0; i < table.Rows.Count; i++)
                {

                    string s2 = table.Rows[i][5].ToString();
                    string s3 = s2.Substring(11);
                    s = s3 + " " + table.Rows[i][8].ToString() + " " + table.Rows[i][12].ToString();
                    t[i] = s;
                }
                return t;
            }
        }

        internal static int[] tworzenie_tablicy_ID_seansow(DataTable table)
        {
            tabela_ID_seansow = new int[table.Rows.Count];
            for (int i = 0; i < table.Rows.Count; i++)
            {
               tabela_ID_seansow[i] = (int) table.Rows[i][0];
            }
            return tabela_ID_seansow;
        }

        internal static bool pobierz_dane_o_seansie(string wybrany_seans_z_listy, string l_nor, string l_sen, string l_stu)
        {
            int ID=0;
            for(int i=0; i< tabela_ID_seansow.Length; i++)
            {
                if(tabela_ID_seansow[i]== (int.Parse(wybrany_seans_z_listy)+1))
                {
                    ID = i;
                }
            }

            ID_seansu = tabela_ID_seansow[ID];
            int suma_miejsc = int.Parse(l_nor) + int.Parse(l_sen) + int.Parse(l_stu);

            SqlConnection con = new SqlConnection(constring);
            con.Open();
            string q = "select * from Miejsca where Miejsca.ID_Seansu = " + ID_seansu;
            SqlCommand cmd = new SqlCommand(q, con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable set = new DataTable();
            adapter.Fill(set);
            Sprzedaz.status_miejsc_na_seans = set;
            if (sprawdzenie_ilosc_dostepnych_miejsc_na_seans(set) < suma_miejsc) return false;
            return true;
        }

        internal static int sprawdzenie_ilosc_dostepnych_miejsc_na_seans(DataTable table)
        {
            int counter = 0;

            for (int i = 0; i < table.Rows.Count; i++)
            {
                if (table.Rows[i][7].ToString() == "wolne") counter++;
            }
            return counter;
        }

        internal static bool czy_miejsce_wolne(int i)
        { 
             if(status_miejsc_na_seans.Rows[i][7].ToString().Equals("wolne"))
             {
                return true;
             }
            return false;
        }

        internal static string oblicz_cene(string l_nor, string l_sen, string l_stu)
        {
            string text;
            SqlConnection con = new SqlConnection(constring);
            con.Open();
            string q = "select * from Seanse where Seanse.ID = " + ID_seansu;
            SqlCommand cmd = new SqlCommand(q, con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable set = new DataTable();
            adapter.Fill(set);
            cena_podstawowa_miejsca = int.Parse(set.Rows[0][4].ToString());

            int procent_znizki; //ile procent ceny trzeba zaplacic

            if(Klient_jest_aktywny)
            {
                procent_znizki = oblicz_znizke();
            }
            else
            {
                procent_znizki = 100;
            }

            int cena_za_normalny = cena_podstawowa_miejsca * procent_znizki/100;
            int cena_za_seniorski = cena_podstawowa_miejsca * CCentrum_Wszechswiata.podaj_znizke_dla_seniora() / 100 * procent_znizki / 100;
            int cena_za_studencki = cena_podstawowa_miejsca * CCentrum_Wszechswiata.podaj_znizke_dla_studenta() / 100 * procent_znizki / 100;
            
            text = "Wybrano:" + Environment.NewLine;
            if(int.Parse(l_nor) != 0)
            {
                text = text + "Normalne: " + l_nor + " x " + cena_za_normalny + "  Razem: " + cena_za_normalny * int.Parse(l_nor) + "PLN" + Environment.NewLine;
            }
            if (int.Parse(l_sen) != 0)
            {
                text = text + "Seniorskie: " + l_sen + " x " + cena_za_seniorski + "  Razem: " + cena_za_seniorski * int.Parse(l_sen) + "PLN" + Environment.NewLine;
            }
            if (int.Parse(l_stu) != 0)
            {
                text = text + "Ulgowe: " + l_stu + " x " + cena_za_studencki + "  Razem: " + cena_za_normalny * int.Parse(l_stu) + "PLN" + Environment.NewLine;
            }

            text = text + Environment.NewLine + "Razem do zaplaty: " + ((cena_za_normalny * int.Parse(l_nor)) + (cena_za_seniorski * int.Parse(l_sen))+ (cena_za_normalny * int.Parse(l_stu)))
                + "PLN" +Environment.NewLine;

            return text;
        }

        internal static bool sprawdz_poprawnosc_podanego_id(string ID)
        {
            SqlConnection con = new SqlConnection(constring);
            con.Open();
            string q = "select * from Klienci where ID = " + ID;
            SqlCommand cmd = new SqlCommand(q, con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable set = new DataTable();
            adapter.Fill(set);
            dane_aktywnego_klienta = set;

            if (set.Rows.Count > 0)
            {
                ID_klienta = int.Parse(ID);
                return true;
            }
            else
            {
                return false;
            } 
        }

        internal static bool sprawdz_czy_przysluguje_znizka(bool seni, bool stud)
        {
            if(seni)
            {
                if( dane_aktywnego_klienta.Rows[0][3].ToString().Equals("1") )
                {
                    return false;
                }
            }
            if (stud)
            {
                if( dane_aktywnego_klienta.Rows[0][4].ToString().Equals("1") )
                {
                    return false;
                }
            }
            return true;
        }

        internal static int oblicz_znizke()
        {
            int znizka;
            int ile_biletow_zakupiono = podaj_ile_biletow_zakupil_aktywny_klient_w_przedziale_czasu_ustawionym_w_CCentrum_Wszechswiata();

            if(ile_biletow_zakupiono >= CCentrum_Wszechswiata.podaj_ile_biltow_nabyc_na_znizke())
            {
                return CCentrum_Wszechswiata.podaj_wartosc_znizki();
            }
            return 1;
        }

        internal static int podaj_ile_biletow_zakupil_aktywny_klient_w_przedziale_czasu_ustawionym_w_CCentrum_Wszechswiata()
        {
            DateTime thisDay = DateTime.Today;
            DateTime StartDay = thisDay.AddDays(-CCentrum_Wszechswiata.podaj_w_jakim_przedziale_czasu_nalezy_nabyc_bilety_na_znizke());
            string StartDayS = StartDay.ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ss");

            SqlConnection con = new SqlConnection(constring);
            con.Open();
            string q = "select * from Bilety where ID_Klienta = " + ID_klienta + "and DataZakupu > '" + StartDayS + "'";
            SqlCommand cmd = new SqlCommand(q, con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable set = new DataTable();
            adapter.Fill(set);

            return set.Rows.Count;
        }
    }
}
