import { gql } from "apollo-server";

export default gql`
  type Query {
    seeProducts(page: Int!): [Product]
  }
`;
