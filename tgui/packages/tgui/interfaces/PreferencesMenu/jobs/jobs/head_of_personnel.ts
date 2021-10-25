import { Job } from "../base";
import { Captain } from "../departments";

const HeadOfPersonnel: Job = {
  name: "Head of Personnel",
  description: "Alter access on ID cards, assist the Captain in management, \
    protect Ian, run the station when the captain dies.",
  department: Captain,
};

export default HeadOfPersonnel;
