void main() {
  String? phone = 'Galaxy Quantum 3';
  print(phone?.startsWith('Galaxy')); // true
  phone = null;
  print(phone?.startsWith('iPhone')); // null
}
