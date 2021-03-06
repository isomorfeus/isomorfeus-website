const path = require('path');
const webpack = require('webpack');
const OwlResolver = require('opal-webpack-loader/resolver');
const CompressionPlugin = require("compression-webpack-plugin"); // for gzipping the packs
const TerserPlugin = require('terser-webpack-plugin');
const WebpackAssetsManifest = require('webpack-assets-manifest');

const common_config = {
    context: path.resolve(__dirname, '../app'),
    mode: "production",
    performance: {
        maxAssetSize: 20000000,
        maxEntrypointSize: 20000000
    },
    output: {
        filename: '[name]-[chunkhash].js', // include fingerprint in file name, so browsers get the latest
        path: path.resolve(__dirname, '../public/assets'),
        publicPath: '/assets/'
    },
    resolve: {
        plugins: [
            new OwlResolver('resolve', 'resolved') // resolve ruby files
        ]
    },
    plugins: [
        new CompressionPlugin({ test: /^((?!application_ssr).)*$/, cache: true }), // gzip compress
        new WebpackAssetsManifest({ publicPath: true, merge: true }) // generate manifest
    ],
    module: {
        rules: [
            {
                test: /.scss$/,
                use: [
                    { loader: "style-loader" },
                    {
                        loader: "css-loader",
                        options: {
                            sourceMap: false, // set to false to speed up hot reloads
                            minimize: true // set to false to speed up hot reloads
                        }
                    },
                    {
                        loader: "sass-loader",
                        options: {
                            includePath: [path.resolve(__dirname, '../app/styles')],
                            sourceMap: false // set to false to speed up hot reloads
                        }
                    }
                ]
            },
            {
                // loader for .css files
                test: /.css$/,
                use: [ "style-loader", "css-loader" ]
            },
            {
                test: /.(png|svg|jpg|gif|woff|woff2|eot|ttf|otf)$/,
                use: [ "file-loader" ]
            },
            {
                // opal-webpack-loader will compile and include ruby files in the pack
                test: /(\.js)?\.rb$/,
                use: [
                    {
                        loader: 'opal-webpack-loader',
                        options: {
                            sourceMap: false,
                            hmr: false
                        }
                    }
                ]
            }
        ]
    }
};

const browser_config = {
    target: 'web',
    optimization: {
        minimize: true, // minimize
        minimizer: [new TerserPlugin({ parallel: true, cache: true, sourceMap: false, terserOptions: { output: { comments: false }}})],
        // splitChunks: { chunks: 'all' }
    },
    entry: { application: [path.resolve(__dirname, '../app/imports/application.js')] }
};

const browser_debug_guide_config = {
    mode: "development",
    optimization: { minimize: false },
    devtool: 'source-map',
    target: 'web',
    optimization: {
        minimize: true, // minimize
        minimizer: [new TerserPlugin({ parallel: true, cache: true })]
    },
    plugins: [
        new CompressionPlugin({ test: /^((?!application_ssr).)*$/, cache: true }), // gzip compress
        new WebpackAssetsManifest({ publicPath: true, merge: true }), // generate manifest
        new webpack.DefinePlugin({
            OPAL_DEVTOOLS_OBJECT_REGISTRY: true
        })
    ],
    entry: { application_debug_guide: [path.resolve(__dirname, '../app/imports/application_debug_guide.js')] },
    module: {
        rules: [
            {
                test: /.scss$/,
                use: [
                    { loader: "style-loader" },
                    {
                        loader: "css-loader",
                        options: {
                            sourceMap: false, // set to false to speed up hot reloads
                            minimize: true // set to false to speed up hot reloads
                        }
                    },
                    {
                        loader: "sass-loader",
                        options: {
                            includePath: [path.resolve(__dirname, '../app/styles')],
                            sourceMap: false // set to false to speed up hot reloads
                        }
                    }
                ]
            },
            {
                // loader for .css files
                test: /.css$/,
                use: [ "style-loader", "css-loader" ]
            },
            {
                test: /.(png|svg|jpg|gif|woff|woff2|eot|ttf|otf)$/,
                use: [ "file-loader" ]
            },
            {
                // opal-webpack-loader will compile and include ruby files in the pack
                test: /.(rb|js.rb)$/,
                use: [
                    {
                        loader: 'opal-webpack-loader',
                        options: {
                            sourceMap: true,
                            hmr: false
                        }
                    }
                ]
            }
        ]
    }
};

const ssr_config = {
    target: 'node',
    optimization: {
        minimize: true, // minimize
        minimizer: [new TerserPlugin({ parallel: true, cache: true, sourceMap: false, terserOptions: { output: { comments: false }}})]
    },
    entry: { application_ssr: [path.resolve(__dirname, '../app/imports/application_ssr.js')] }
};

// const web_worker_config = {
//     target: 'webworker',
//     entry: { web_worker: [path.resolve(__dirname, '../app/imports/application_web_worker.js')] }
// };

const browser = Object.assign({}, common_config, browser_config);
const browser_debug_guide = Object.assign({}, common_config, browser_debug_guide_config);
const ssr = Object.assign({}, common_config, ssr_config);
// const web_worker = Object.assign({}, common_config, web_worker_config);

module.exports = [ browser, browser_debug_guide, ssr ];
