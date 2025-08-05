// The WOMGNIX Server will be added later...
import type { ISourceOptions } from "tsparticles-engine";

// There are no options in this world,only futures (lol)
const options: ISourceOptions = {
  fpsLimit: 60,
  interactivity: {
    detectsOn: "canvas",
    events: {
      onHover: { enable: true, mode: "repulse" },
      onClick: { enable: true, mode: "push" },
      resize: true,
    },
    modes: {
      repulse: { distance: 100, duration: 0.4 },
      push: { quantity: 4 },
    },
  },
  particles: {
    color: { value: "#ff1a1a" },
    links: {
      color: "#ff0000",
      distance: 120,
      enable: true,
      opacity: 0.5,
      width: 2,
    },
    collisions: { enable: true },
    move: {
      direction: "none",
      enable: true,
      outMode: "bounce",
      speed: 2,
    },
    number: { density: { enable: true, area: 800 }, value: 50 },
    opacity: { value: 0.6 },
    shape: { type: "circle" },
    size: { random: true, value: 5 },
  },
  detectRetina: true,
};

export default options;
