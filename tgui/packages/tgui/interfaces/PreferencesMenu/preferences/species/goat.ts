import { Species } from "./base";

const Goat: Species = {
  description: "This common friend in the cold room is actually sentient! \
  They watch over society with that familiar glint in their eye, \
  serving under a common, golden deity.",
  features: {
    good: [{
      icon: "temperature-low",
      name: "Insulation",
      description: "The goat's fur helps to insulate it from colder temperatures.",
    }, {
      icon: "horse-head",
      name: "Ramming Speed",
      description: "Goats can ram people with their large horns.\
      Try not to miss!",
    }],
    neutral: [],
    bad: [{
      icon: "temperature-high",
      name: "Too Hot to Handle",
      description: "The goat's fur is a little <i>too<\i> good at insulating it, \
      causing them to be more susceptible to warmer temperatures.",
    }],
  },
  lore: [
    "Serving under their deity, the Goat King, Goats disguise themselves as common livestock to observe and watch over other sentient races as sentries. Whatever circumstances lead to a goat to revealing its sentience are left up them.",
    "Goats tend to keep to themselves whether by themselves or amongst massive groups. Few if any have any real fighting capabilities, though goats are known to be somewhat aggressive and short tempered at times.",
    "Goats who have revealed their sentience will try to blend into normal society by wearing clothes and standing on two legs.",
  ],
};

export default Goat;
