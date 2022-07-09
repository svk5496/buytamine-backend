import { gql } from "apollo-server";

export default gql`
  type uploadProductResult {
    ok: Boolean!
    error: String
  }
  type Mutation {
    uploadProduct(
      name: String!
      productListReportNo: String
      shape: String
      prmsDate: String
      lastUpdateDate: String
      productShapeConditionName: String
      licenseNo: String
      intakeAttention: String
      brand: String
      dispos: String
      expireDate: String
      howKeep: String
      howTake: String
      rawMaterial: String
      primaryFunction: String
      mainStandard: String
    ): uploadProductResult!
  }
`;
