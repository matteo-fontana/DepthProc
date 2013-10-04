#ifndef DEPTH_INCLUDES
#define DEPTH_INCLUDES

#include "RobCovLibConfig.h"
#include "armadillo"

namespace Depth
{
	// LPDepth
	__declspec(dllexport) arma::vec LPDepth(const arma::mat& X, const double &p, const double& a, const double& b);
	__declspec(dllexport) arma::vec LPDepth(const arma::mat& X, const arma::mat& Y, const double &p, const double& a, const double& b);

	// Mahalanobis Depth
	__declspec(dllexport) arma::vec MahalanobisDepth(const arma::mat& X);
	__declspec(dllexport) arma::vec MahalanobisDepth(const arma::mat& X, const arma::mat& Y);
}

#endif