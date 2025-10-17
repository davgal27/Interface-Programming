﻿using System.Windows;
using System.Windows.Input;
using WPFWeather.App.Services;
using WPFWeather.App.ViewModels;

namespace WPFWeather.App.Windows
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            DataContext = new WeatherViewModel(new WeatherDiskService());
        }
    }
}