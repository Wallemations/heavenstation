import { createLanguagePerk, Species } from "./base";

const Spirit: Species = {
  description: "Ghosts kept alive by a single purpose. Generally friendly, \
  except for the part where they go insane and turn into monsters",
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
    neutral: [{
      icon: "assistive-listening-systems",
      name: "Friends on The Other Side",
      description: "You can occasionally hear the voices of those who've passed. \
      This is often extremely annoying.",
    }],
    bad: [{
      icon: "cross",
      name: "Tainted Soul",
      description: "You're highly susceptible to attacks from holy objects and people.",
    }, {
      icon: "shoe-prints",
      name: "Unholy Light",
      description: "You're incapable of moving over piles of salt or blessed \
      floorings. Try to stay on the chaplain's good side, alright?",
    }, {
      icon: "lightbulb",
      name: "Blinded by The Light",
      description: "Your body leaves you considerably more susceptible to sudden flashes of light.",
    }],
  },
  lore: ["Spirits can only come about through strange circumstance or the intervention of a higher power, as most ghosts will pass on within hours to a few days after death.",
    "Their unnatural continued existence causes them to be extremely volatile, becoming hypersensitive to emotions and reaching a 'feral' state if not dispatched, where they'll become destructive forces influenced by what emotion they felt was the strongest.",
    "Not much research has been done on spirits, as the leading researcher has since gone missing, but it is believed spirits are simple, goal-oriented beings who will pass on naturally after achieving said goals."],
};

export default Spirit;
