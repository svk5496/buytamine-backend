import { gql } from "apollo-server";

export default gql`
  type HealthGoal {
    id: Int!
    name: String!
    products: [Product]
    iconSmall: String
    iconMedium: String
    iconLarge: String
    bio: String
    link: String
    rank: Int!
    healthGoalClicks: [HealthGoalClick]
    createdAt: String!
    updatedAt: String!
  }

  type HealthGoalClick {
    id: Int!
    user: User
    userId: Int
    healthGoal: HealthGoal
    healthGoalId: Int
    createdAt: String!
    updatedAt: String!
  }
`;
