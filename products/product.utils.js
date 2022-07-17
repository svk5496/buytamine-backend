export const processRawMaterials = (rawMaterial) => {
  const rawMaterialArray = [];
  const rawMaterials = rawMaterial.match(
    /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|\w)α.%( -]+\([^)]*\)+|[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|\w)α.%( -]+\[(.*?)\]|[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|\w)α.%( -]+/g
  );

  rawMaterials.map((rawMaterial) => {
    const withOutSpace = rawMaterial.replace(/\s/g, "");
    rawMaterialArray.push({
      where: { rawMaterial: withOutSpace },
      create: { rawMaterial: withOutSpace },
    });
  });
  return rawMaterialArray;
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
  const mainStandardArray = [];

  const mainStandards = mainStandard.match(/[^\n|\r]+/g);
  mainStandards.map((mainStandard) => {
    const withOutSpace = mainStandard.replace(/\s/g, "");
    const withOutNumber = withOutSpace.replace(
      /\([^]\)+|^[0-9.)(]+|[⓪①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮⑯⑰⑱⑲⑳⑴⑵⑶⑷⑸⑹⑺⑻⑼⑽⑾⑿⒀⒁⒂⒃⒄⒅⒆⒇*]+/g,
      ""
    );
    let msArray = withOutNumber.match(/[^:]+/g);
    mainStandardArray.push({
      // where: {
      //   mainStandard: msArray[0],

      //   amount: msArray[1],
      // },
      // create: { mainStandard: msArray[0], amount: msArray[1] },
      mainStandard: msArray[0],
      amount: msArray[1],
    });
  });
  return mainStandardArray;
};

export const processIntakeAttentions = (intakeAttention) => {
  const intakeAttentions = intakeAttention.match(/[^\n|\r]+/g);
  return intakeAttentions.map((intakeAttention) => ({
    where: { intakeAttention },
    create: { intakeAttention },
  }));
};
