import client from "../client";

export default {
  Product: {
    rawMaterials: ({ id }) => {
      return client.rawMaterial.findMany({
        where: {
          products: {
            some: {
              id,
            },
          },
        },
      });
    },
    primaryFunctions: ({ id }) => {
      return client.primaryFunction.findMany({
        where: {
          products: {
            some: {
              id,
            },
          },
        },
      });
    },
    mainStandards: ({ id }) => {
      return client.mainStandard.findMany({
        where: {
          products: {
            some: {
              id,
            },
          },
        },
      });
    },
    intakeAttentions: ({ id }) => {
      return client.intakeAttention.findMany({
        where: {
          products: {
            some: {
              id,
            },
          },
        },
      });
    },
    brand: ({ brandId }) =>
      client.brand.findUnique({
        where: {
          id: brandId,
        },
      }),
  },
};
