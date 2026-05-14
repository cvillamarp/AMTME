export function joinClasses(...values: Array<string | false | undefined>) {
  return values.filter(Boolean).join(' ');
}

export function formatDate(value: string) {
  if (!value) return 'Sin fecha';
  const date = new Date(value);
  if (Number.isNaN(date.getTime())) return value;
  return new Intl.DateTimeFormat('es-ES', {
    year: 'numeric',
    month: 'short',
    day: '2-digit',
  }).format(date);
}
