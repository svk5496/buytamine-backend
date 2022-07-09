import client from "../../client";
import { protectedResolver } from "../../users/users.utils";

export default {
  Query: {
    seeTopNutrients: (_, { offset }) =>
      client.nutrient.findMany({
        take: 8,
        skip: offset,
        orderBy: {
          rank: "asc",
        },
      }),
  },
};
