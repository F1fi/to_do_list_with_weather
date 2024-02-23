class TempAdapter{
  static const _tempTypeDifference = 273.15;
  
  final double kelvin;
  
  double get celsius => (kelvin - _tempTypeDifference);  

  const TempAdapter.fromKelvin(this.kelvin);

  const TempAdapter.fromCelsius(double celsius)
    : kelvin = celsius + _tempTypeDifference;
}