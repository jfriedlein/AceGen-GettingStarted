#ifndef EIGENVECTORS_CPP
#define EIGENVECTORS_CPP
// @todo Use try-catch block and return failed-flag
void eigenvectors( double symAR[3][3], double EW[3], double EV[3][3] )
{
    SymmetricTensor<2,3> symTEN;
    for (unsigned int i = 0; i < 3; ++i)
	    for (unsigned int j = i; j < 3; ++j)
            symTEN[i][j] = symAR[i][j];


    Tensor<1,3> tmpOut;
	for (unsigned int i = 0; i < 3; ++i)
	{
        if ( symTEN.norm() < 1e-20 )
        {
            EW[i] = 1.;
            EV[i][i] = 1.;
        }
        else
        {
            EW[i] = std::max( eigenvectors(symTEN)[i].first, 0.);
            tmpOut = eigenvectors(symTEN)[i].second;
            EV[0][i] = tmpOut[0];
            EV[1][i] = tmpOut[1];
            EV[2][i] = tmpOut[2];
        }
    }
}
#endif // EIGENVECTORS_CPP