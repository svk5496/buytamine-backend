import client from "../../client";

export default {
  Query: {
    seeProductsWithHG: async (_, { sort, lastId }) => {
      if (!sort) {
        const allProducts = await client.product.findMany({
          take: 12,
          skip: lastId ? 1 : 0,
          ...(lastId && { cursor: { id: lastId } }),
          orderBy: {
            noUserClick: "desc",
          },
        });
        return {
          ok: true,
          products: allProducts,
        };
      }
      const products = await client.healthGoal
        .findFirst({ where: { name: sort } })
        .products({
          take: 12,
          skip: lastId ? 1 : 0,
          ...(lastId && { cursor: { id: lastId } }),
          orderBy: {
            noUserClick: "desc",
          },
        });
      return {
        ok: true,
        products,
      };
    },
  },
};
