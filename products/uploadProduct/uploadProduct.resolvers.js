import client from "../../client";
import {
  processRawMaterials,
  processPrimaryFunctions,
  processMainStandards,
  processIntakeAttentions,
} from "../product.utils";

export default {
  Mutation: {
    uploadProduct: async (
      _,
      {
        name,
        productListReportNo,
        shape,
        prmsDate,
        lastUpdateDate,
        productShapeConditionName,
        licenseNo,
        brand,
        dispos,
        expireDate,
        howKeep,
        howTake,
        rawMaterial,
        intakeAttention,
        primaryFunction,
        mainStandard,
      }
    ) => {
      try {
        // 브랜드 object
        let brandObj = "";
        brandObj = brand;
        if (brandObj) {
          // 브랜드가 있는지 없는지
          const existingBrand = await client.brand.findFirst({
            where: {
              name: brand,
            },
          });
          // 브랜드가 존재하지 않는다면
          if (!existingBrand) {
            await client.brand.create({
              data: {
                name: brand,
              },
            });
          }
        }

        //Raw Metarila
        let rawMaterialObjs = [];
        if (rawMaterial) {
          rawMaterialObjs = processRawMaterials(rawMaterial);
        }

        let primaryFunctionObjs = [];
        if (primaryFunction) {
          primaryFunctionObjs = processPrimaryFunctions(primaryFunction);
        }

        let intakeAttentionObjs = [];
        if (intakeAttention) {
          intakeAttentionObjs = processIntakeAttentions(intakeAttention);
        }

        let mainStandardObjs = [];
        if (mainStandard) {
          mainStandardObjs = processMainStandards(mainStandard);
        }

        const existingProduct = await client.product.findFirst({
          where: {
            name,
          },
        });

        if (existingProduct) {
          const updateProduct = await client.product.update({
            where: {
              name,
            },
            data: {
              name,
              productListReportNo,
              shape,
              prmsDate,
              lastUpdateDate,
              productShapeConditionName,
              licenseNo,
              dispos,
              expireDate,
              howKeep,
              howTake,
              brand: {
                connect: {
                  name: brand,
                },
              },
              ...(rawMaterialObjs.length > 0 && {
                rawMaterials: {
                  set: [], //기존에 연결된걸 없애줌.
                  connectOrCreate: rawMaterialObjs,
                },
              }),
              ...(intakeAttentionObjs.length > 0 && {
                intakeAttentions: {
                  set: [], //기존에 연결된걸 없애줌.
                  connectOrCreate: intakeAttentionObjs,
                },
              }),
              ...(primaryFunctionObjs.length > 0 && {
                primaryFunctions: {
                  set: [], //기존에 연결된걸 없애줌.
                  connectOrCreate: primaryFunctionObjs,
                },
              }),
              ...(mainStandardObjs.length > 0 && {
                mainStandards: {
                  set: [], //기존에 연결된걸 없애줌.
                  connectOrCreate: mainStandardObjs,
                },
              }),
            },
          });
          if (updateProduct.id) {
            return {
              ok: true,
              error: "update is completed",
            };
          }
        }

        await client.product.create({
          data: {
            name,
            productListReportNo,
            shape,
            prmsDate,
            lastUpdateDate,
            productShapeConditionName,
            licenseNo,
            dispos,
            expireDate,
            howKeep,
            howTake,
            brand: {
              connect: {
                name: brand,
              },
            },
            ...(rawMaterialObjs.length > 0 && {
              rawMaterials: {
                connectOrCreate: rawMaterialObjs,
              },
            }),
            ...(intakeAttentionObjs.length > 0 && {
              intakeAttentions: {
                connectOrCreate: intakeAttentionObjs,
              },
            }),
            ...(primaryFunctionObjs.length > 0 && {
              primaryFunctions: {
                connectOrCreate: primaryFunctionObjs,
              },
            }),
            ...(mainStandardObjs.length > 0 && {
              mainStandards: {
                connectOrCreate: mainStandardObjs,
              },
            }),
          },
        });
        return {
          ok: true,
          error: "Creation Succeed",
        };
      } catch (e) {
        return { ok: false, error: "Can't create products" };
      }
    },
  },
};
