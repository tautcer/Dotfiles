module.exports = {
  env: {
    browser: true,
    es6: true,
    node: true
  },
  extends: [
    'plugin:@typescript-eslint/recommended',
    'plugin:@typescript-eslint/recommended-requiring-type-checking',
    'prettier/@typescript-eslint',
    'plugin:prettier/recommended',
    'prettier'
  ],
  ignorePatterns: [],
  parser: '@typescript-eslint/parser',
  parserOptions: {
    project: 'tsconfig.json',
    sourceType: 'module'
  },
  plugins: ['@typescript-eslint', 'prefer-arrow', 'import', 'jsdoc'],
  rules: {
    '@typescript-eslint/adjacent-overload-signatures': 'warn',
    '@typescript-eslint/array-type': 'off',
    '@typescript-eslint/ban-types': 'warn',
    '@typescript-eslint/class-name-casing': 'warn',
    '@typescript-eslint/consistent-type-assertions': 'warn',
    '@typescript-eslint/consistent-type-definitions': 'warn',
    '@typescript-eslint/explicit-member-accessibility': [
      'off',
      {
        accessibility: 'explicit'
      }
    ],
    // check if this is needed as it seems to conflict with prettier
    //'@typescript-eslint/indent': [
    //  'warn',
    //  2,
    //  {
    //    FunctionDeclaration: {
    //      parameters: 'first'
    //    },
    //    FunctionExpression: {
    //      parameters: 'first'
    //    }
    //  }
    //],
    '@typescript-eslint/interface-name-prefix': 'off',
    '@typescript-eslint/member-delimiter-style': [
      'warn',
      {
        multiline: {
          delimiter: 'semi',
          requireLast: true
        },
        singleline: {
          delimiter: 'semi',
          requireLast: false
        }
      }
    ],
    '@typescript-eslint/member-ordering': 'warn',
    '@typescript-eslint/no-empty-function': 'off',
    '@typescript-eslint/no-empty-interface': 'warn',
    '@typescript-eslint/no-explicit-any': 'off',
    '@typescript-eslint/no-inferrable-types': 'warn',
    '@typescript-eslint/no-misused-new': 'warn',
    '@typescript-eslint/no-namespace': 'warn',
    '@typescript-eslint/no-parameter-properties': 'off',
    '@typescript-eslint/no-use-before-define': 'off',
    '@typescript-eslint/no-var-requires': 'off',
    '@typescript-eslint/prefer-for-of': 'warn',
    '@typescript-eslint/prefer-function-type': 'warn',
    '@typescript-eslint/prefer-namespace-keyword': 'warn',
    '@typescript-eslint/quotes': ['warn', 'single'],
    '@typescript-eslint/semi': ['warn', 'always'],
    '@typescript-eslint/triple-slash-reference': 'warn',
    '@typescript-eslint/type-annotation-spacing': 'warn',
    '@typescript-eslint/unified-signatures': 'warn',
    'arrow-body-style': 'warn',
    'arrow-parens': ['off', 'as-needed'],
    camelcase: 'warn',
    'comma-dangle': 'off',
    complexity: 'off',
    'constructor-super': 'warn',
    curly: 'warn',
    'dot-notation': 'warn',
    'eol-last': 'warn',
    eqeqeq: ['warn', 'smart'],
    'guard-for-in': 'warn',
    'id-blacklist': ['warn', 'any', 'Number', 'number', 'String', 'string', 'Boolean', 'boolean'],
    'id-match': 'warn',
    'import/no-deprecated': 'warn',
    'import/order': 'off',
    'jsdoc/no-types': 'warn',
    'max-classes-per-file': 'off',
    'max-len': [
      'warn',
      {
        code: 140
      }
    ],
    'new-parens': 'warn',
    'no-bitwise': 'warn',
    'no-caller': 'warn',
    'no-cond-assign': 'warn',
    'no-console': ['warn'],
    'no-debugger': 'warn',
    'no-empty': 'off',
    'no-eval': 'warn',
    'no-fallthrough': 'warn',
    'no-invalid-this': 'off',
    'no-multiple-empty-lines': 'off',
    'no-new-wrappers': 'warn',
    'no-restricted-imports': ['warn', 'rxjs/Rx'],
    'no-shadow': [
      'warn',
      {
        hoist: 'all'
      }
    ],
    'no-throw-literal': 'warn',
    'no-trailing-spaces': 'warn',
    'no-undef-init': 'warn',
    'no-underscore-dangle': 'warn',
    'no-unsafe-finally': 'warn',
    'no-unused-expressions': 'warn',
    'no-unused-labels': 'warn',
    'no-var': 'warn',
    'object-shorthand': 'warn',
    'one-var': ['warn', 'never'],
    'prefer-arrow/prefer-arrow-functions': 'warn',
    'prefer-const': 'warn',
    'quote-props': ['warn', 'as-needed'],
    radix: 'warn',
    'space-before-function-paren': [
      'warn',
      {
        anonymous: 'never',
        asyncArrow: 'always',
        named: 'never'
      }
    ],
    'spaced-comment': 'warn',
    'use-isnan': 'warn',
    'valid-typeof': 'off',
    '@typescript-eslint/await-thenable': ['error'],
    '@typescript-eslint/no-for-in-array': ['error'],
    '@typescript-eslint/no-misused-promises': ['error'],
    '@typescript-eslint/no-unnecessary-type-assertion': ['error'],
    '@typescript-eslint/prefer-includes': ['error'],
    '@typescript-eslint/prefer-regexp-exec': ['error'],
    '@typescript-eslint/prefer-string-starts-ends-with': ['error'],
    'require-await': ['off'],
    '@typescript-eslint/require-await': ['error'],
    // Rule switched off as produces many errors
    // Only throws errors in spec files since we're not using "this." syntax as it's unnecessary
    // TODO: Address in future and switch back on
    '@typescript-eslint/unbound-method': ['off'],
    'prefer-rest-params': ['error'],
    'prefer-spread': ['error'],
    '@typescript-eslint/ban-ts-ignore': ['error'],
    '@typescript-eslint/camelcase': ['error'],
    '@typescript-eslint/explicit-function-return-type': ['off'],
    'no-array-constructor': ['off'],
    '@typescript-eslint/no-array-constructor': ['error'],
    'no-empty-function': ['off'],
    '@typescript-eslint/no-non-null-assertion': ['warn'],
    '@typescript-eslint/no-this-alias': ['error'],
    'no-unused-vars': ['off'],
    '@typescript-eslint/no-unused-vars': ['warn'],
    'no-use-before-define': ['off']
  },
  settings: {
    'import/parsers': {
      '@typescript-eslint/parser': ['.ts']
    }
  }
};
