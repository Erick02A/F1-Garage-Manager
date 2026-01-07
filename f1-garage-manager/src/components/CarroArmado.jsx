import { useState } from "react";
import { catalogoPartes } from "../data/partesCatalogo";

export default function CarroArmado({ nombreCarro }) {
  const [armado, setArmado] = useState({
    powerUnit: catalogoPartes.powerUnit[0],
    aerodinamica: catalogoPartes.aerodinamica[0],
    neumaticos: catalogoPartes.neumaticos[0],
    suspension: catalogoPartes.suspension[0],
    caja: catalogoPartes.caja[0]
  });

  const calcularTotales = () => {
    let P = 0, A = 0, M = 0;
    Object.values(armado).forEach(p => {
      P += p.p;
      A += p.a;
      M += p.m;
    });
    return { P, A, M };
  };

  const { P, A, M } = calcularTotales();

  const cambiarParte = (categoria, index) => {
    setArmado({
      ...armado,
      [categoria]: catalogoPartes[categoria][index]
    });
  };

  return (
    <div style={{ border: "1px solid gray", padding: "10px", marginBottom: "15px" }}>
      <h3>{nombreCarro}</h3>

      {Object.keys(catalogoPartes).map(cat => (
        <div key={cat}>
          <label>{cat}: </label>
          <select onChange={e => cambiarParte(cat, e.target.value)}>
            {catalogoPartes[cat].map((p, i) => (
              <option key={i} value={i}>
                {p.nombre} (P:{p.p} A:{p.a} M:{p.m})
              </option>
            ))}
          </select>
        </div>
      ))}

      <h4>Resumen del Carro</h4>
      <ul>
        <li>P: {P}</li>
        <li>A: {A}</li>
        <li>M: {M}</li>
      </ul>
    </div>
  );
}
