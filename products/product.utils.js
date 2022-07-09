export const processRawMaterials = (rawMaterial) => {
  const rawMaterials = rawMaterial.match(
    /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|\w)α.%( -]+\([^)]*\)|[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|\w)α.%( -]+/g
  );
  return rawMaterials.map((rawMaterial) => ({
    where: { rawMaterial },
    create: { rawMaterial },
  }));
};

export const processPrimaryFunctions = (primaryFunction) => {
  const primaryFunctions = primaryFunction.match(
    /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|\w)α.%( -]+\([^)]*\)|[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|\w)α.%( -]+/g
  );
  return primaryFunctions.map((primaryFunction) => ({
    where: { primaryFunction },
    create: { primaryFunction },
  }));
};

export const processMainStandards = (mainStandard) => {
  const mainStandards = mainStandard.match(/[^\n|\r]+/g);
  return mainStandards.map((mainStandard) => ({
    where: { mainStandard },
    create: { mainStandard },
  }));
};

export const processIntakeAttentions = (intakeAttention) => {
  const intakeAttentions = intakeAttention.match(/[^\n|\r]+/g);
  return intakeAttentions.map((intakeAttention) => ({
    where: { intakeAttention },
    create: { intakeAttention },
  }));
};
