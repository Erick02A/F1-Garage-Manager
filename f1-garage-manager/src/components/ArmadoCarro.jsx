export default function ArmadoCarro() {
  const P = 12;
  const A = 15;
  const M = 10;

  return (
    <div>
      <h2>Armado del Carro</h2>
      <p>Power Unit: PU-1</p>
      <p>Aerodinámica: Aero-2</p>
      <p>Neumáticos: Soft</p>
      <p>Suspensión: S-1</p>
      <p>Caja de Cambios: G-1</p>

      <h3>Resumen</h3>
      <ul>
        <li>P: {P}</li>
        <li>A: {A}</li>
        <li>M: {M}</li>
      </ul>
    </div>
  );
}
