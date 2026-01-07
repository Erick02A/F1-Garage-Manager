import { engineer } from "../data/mock";

export default function EngineerView() {
  return (
    <div>
      <h2>Vista Engineer</h2>
      <p><strong>Nombre:</strong> {engineer.nombre}</p>
      <p><strong>Equipo:</strong> {engineer.equipo}</p>

      <h3>Carros</h3>
      <ul>
        {engineer.carros.map((c, i) => (
          <li key={i}>{c}</li>
        ))}
      </ul>

      <h3>Inventario de Partes</h3>
      <ul>
        {engineer.partes.map((p, i) => (
          <li key={i}>
            {p.categoria} – Cantidad: {p.cantidad}
          </li>
        ))}
      </ul>
    </div>
  );
}
