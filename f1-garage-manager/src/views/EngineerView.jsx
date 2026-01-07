import CarroArmado from "../components/CarroArmado";

export default function EngineerView() {
  return (
    <div>
      <h2>Vista Engineer</h2>
      <p><strong>Equipo:</strong> Red Apex</p>

      <CarroArmado nombreCarro="Carro 1" />
      <CarroArmado nombreCarro="Carro 2" />
    </div>
  );
}
