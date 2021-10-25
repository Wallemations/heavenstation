import { Species } from "./base";

const Spirit: Species = {
  description: "",
  features: {
    good: [{
      icon: "shield-alt",
      name: "Nearly Indestructable",
      description: "The fact that you're mostly incoporeal makes you immune to most \
      dangerous environments, though a good punch will still hurt.",
    }, {
      icon: "ghost",
      name: "Incoporeal",
      description: "Your semi-incoporeal form allows you to crawl through vents with relative ease.",
    }, {
      icon: "feather-alt",
      name: "Flight",
      description: "You can float a few feet off the ground.",
    }, createLanguagePerk("Spiritual")],
    neutral: [],
    bad: [{
      icon: "cross",
      name: "Tainted Soul",
      description: "You're highly susceptible to attacks from holy objects and people.",
    }, {
      icon: "shoe-prints",
      name: "Unholy Light",
      description: "You're incapable of moving over piles of salt and blessed \
      floorings. Try to stay on the chaplain's good side, alright?",
    }],
  },
  lore: [
  ],
};

export default Spirit;
