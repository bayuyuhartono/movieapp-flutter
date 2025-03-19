String convertMinutes(int totalMinutes) {
  int hours = totalMinutes ~/ 60;
  int minutes = totalMinutes % 60;
  if (minutes < 0) {
    return '${hours}h';
  }
  return '${hours}h ${minutes}mnt';
}