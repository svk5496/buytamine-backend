import { gql } from "apollo-server";

export default gql`
  type Product {
    id: Int!
    name: String!
    price: Int
    noUserClick: Int!
    thumbnail: String
    coupangLink: String
    coupangReviewCount: Int
    totalReview: Int
    productListReportNo: String
    shape: String
    prmsDate: String
    lastUpdateDate: String
    productShapeConditionName: String
    licenseNo: String
    brand: Brand
    dispos: String
    expireDate: String
    howKeep: String
    howTake: String
    intakeAttentions: [IntakeAttention]
    rawMaterials: [RawMaterial]
    primaryFunctions: [PrimaryFunction]
    mainStandards: [MainStandard]
  }

  type RawMaterial {
    id: Int!
    rawMaterial: String!
    products: [Product]
  }

  type IntakeAttention {
    id: Int!
    intakeAttention: String!
    products: [Product]
  }

  type PrimaryFunction {
    id: Int!
    primaryFunction: String!
    products: [Product]
    nutrients: [Nutrient]
  }

  type MainStandard {
    id: Int!
    mainStandard: String!
    amount: String
    product: Product
    createdAt: String!
    updatedAt: String!
  }

  type Brand {
    id: Int!
    name: String!
    bio: String
    products: [Product]
  }
`;
