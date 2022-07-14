import { gql } from "apollo-server";

export default gql`
  type SeeProductsWithHGResult {
    ok: Boolean!
    error: String
    products: [Product]
  }

  type Query {
    seeProductsWithHG(sort: String, lastId: Int): SeeProductsWithHGResult!
  }
`;
