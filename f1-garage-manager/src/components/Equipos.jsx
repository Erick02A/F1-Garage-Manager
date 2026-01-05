import { equipos } from "../data/equipos";

export default function Equipos() {
  return (
    <div>
      <h2>Equipos</h2>
      <ul>
        {equipos.map(e => (
          <li key={e.id}>{e.nombre}</li>
        ))}
      </ul>
    </div>
  );
}
