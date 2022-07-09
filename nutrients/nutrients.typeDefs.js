import { gql } from "apollo-server";

export default gql`
  type Nutrient {
    id: Int!
    name: String!
    products: [Product]
    banner: String
    link: String
    primaryFunctions: [PrimaryFunction]
    bio: String
    createdAt: String!
    updatedAt: String!
  }
`;
