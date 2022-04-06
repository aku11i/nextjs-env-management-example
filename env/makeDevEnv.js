/**
 * Generate environment variables for dev dynamically.
 */
module.exports = ({ env, SECRET_TOKEN }) => ({
  NEXT_PUBLIC_API_BASE_URL: `https://dev-${env}.example.com`,

  SECRET_TOKEN,
});
