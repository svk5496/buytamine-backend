import client from "../../client";
import { protectedResolver } from "../../users/users.utils";

export default {
  Query: {
    seeTopHealthGoals: (_, { offset }) =>
      client.healthGoal.findMany({
        take: 12,
        skip: offset,
        orderBy: {
          rank: "asc",
        },
      }),
  },
};
