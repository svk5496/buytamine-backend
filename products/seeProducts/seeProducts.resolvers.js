import client from "../../client";

export default {
  Query: {
    seeProducts: (_, { page }) =>
      client.product.findMany({
        take: 5,
        skip: (page - 1) * 5,
        orderBy: {
          noUserClick: "desc",
        },
      }),
  },
};
